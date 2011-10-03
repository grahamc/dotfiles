require 'formula'

class Pianobar < Formula
  url 'https://github.com/sploot/pianobar/zipball/master'
  version '2011.07.14'
  homepage 'https://github.com/PromyLOPh/pianobar/'
  md5 '60a2b246b8d2c071977093a83223a21b'

  head 'https://github.com/sploot/pianobar.git'

  depends_on 'libao'
  depends_on 'mad'
  depends_on 'faad2'

  skip_clean 'bin'

  fails_with_llvm "Reports of this not compiling on Xcode 4"

  def install
    # we discard Homebrew's CFLAGS as Pianobar reportdely doesn't like them
    ENV['CFLAGS'] = "-O2 -DNDEBUG " +
              # fixes a segfault: https://github.com/PromyLOPh/pianobar/issues/138
              "-D_DARWIN_C_SOURCE " +
              # Or it doesn't build at all
              "-std=c99 " +
              # build if we aren't /usr/local'
              "#{ENV["CPPFLAGS"]} #{ENV["LDFLAGS"]}"

    system "make", "PREFIX=#{prefix}"
    system "make", "install", "PREFIX=#{prefix}"

    # Install contrib folder too, why not.
    prefix.install Dir['contrib']
  end
end
