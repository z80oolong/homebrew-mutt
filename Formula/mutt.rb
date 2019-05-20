class Mutt < Formula
  desc "Mongrel of mail user agents (part elm, pine, mush, mh, etc.)"
  homepage "http://www.mutt.org/"

  stable do
    url "https://bitbucket.org/mutt/mutt/downloads/mutt-1.10.1.tar.gz"
    # HTTP is preferred over FTP; Please keep the protocol part below.
    mirror "http://ftp.mutt.org/pub/mutt/mutt-1.10.1.tar.gz"
    sha256 "734a3883158ec3d180cf6538d8bd7f685ce641d2cdef657aa0038f76e79a54a0"

    patch do
      url "https://raw.githubusercontent.com/z80oolong/diffs/master/mutt/mutt-1.10.1-fix.diff"
      sha256 "08cc3a54105ba1f2f3c22d5c2ce553c855167fd04d713695a5b425684da40452"
    end
  end

  head do
    url "https://gitlab.com/muttmua/mutt.git"

    patch do
      url "https://raw.githubusercontent.com/z80oolong/diffs/master/mutt/mutt-HEAD-2366e3d6-fix.diff"
      sha256 "54bd27a4b999e50b2a0cb29c1eff2bf5c1787fc225c35857a0b6a3d03cd71eee"
    end
  end

  option "with-debug", "Build with debug option enabled"
  option "with-s-lang", "Build against slang instead of ncurses"
  option "without-cjk-width", "Disable East Asian Ambiguous characters support"
  option "without-hardlink", "Build for an architecture which does not support hardlinks.(for example, Android 6.0)"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "openssl"
  depends_on "tokyo-cabinet"
  depends_on "gettext" => :optional
  depends_on "gpgme" => :optional
  depends_on "libidn" => :optional
  depends_on "s-lang" => :optional
  unless OS.mac?
    depends_on "bzip2"
    depends_on "zlib"
    depends_on "krb5"
    depends_on "ncurses"
  end

  conflicts_with "tin",
    :because => "both install mmdf.5 and mbox.5 man pages"

  def install
    begin
      user_admin = Etc.getgrnam("admin").mem.include?(ENV["USER"])
    rescue
      user_admin = false
    end

    args = %W[
      --disable-dependency-tracking
      --disable-warnings
      --prefix=#{prefix}
      --with-ssl=#{Formula["openssl"].opt_prefix}
      #{OS.mac? ? "--with-sasl" : "--with-sasl2"}
      --with-gss
      --enable-imap
      --enable-smtp
      --enable-pop
      --enable-hcache
      --with-tokyocabinet
      --enable-sidebar
    ]

    # This is just a trick to keep 'make install' from trying
    # to chgrp the mutt_dotlock file (which we can't do if
    # we're running as an unprivileged user)
    args << "--with-homespool=.mbox" unless (user_admin || build.without?("hardlink"))

    args << "--disable-nls" if build.without? "gettext"
    args << "--enable-gpgme" if build.with? "gpgme"
    args << "--with-slang" if build.with? "s-lang"
    args << "--enable-cjk-ambiguous-width" unless build.without? "cjk-width"

    if build.with? "debug"
      args << "--enable-debug"
    else
      args << "--disable-debug"
    end

    ENV.append "CFLAGS", "-DNO_USE_HARDLINK" if build.without?("hardlink")

    system "./prepare", *args
    system "make"

    # This permits the `mutt_dotlock` file to be installed under a group
    # that isn't `mail`.
    # https://github.com/Homebrew/homebrew/issues/45400
    if user_admin
      inreplace "Makefile", /^DOTLOCK_GROUP =.*$/, "DOTLOCK_GROUP = admin"
    end

    system "make", "install"
  end

  test do
    system bin/"mutt", "-D"
  end
end
