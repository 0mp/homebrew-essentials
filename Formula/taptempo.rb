class Taptempo < Formula
  desc "Command-line tap tempo"
  homepage "https://taptempo.tuxfamily.org/"
  url "https://git.tuxfamily.org/taptempo/taptempo.git/snapshot/taptempo-1.4.5.zip"
  sha256 "06c2dd60860cb3faddff39be058c4a22e6dcbdccb1419ccc920f0c81b6b6f67b"
  license "GPL-3.0-or-later"

  depends_on "cmake" => :build
  depends_on "catch2" => :build
  depends_on "gettext"

  def install
    mkdir "build" do
      system "cmake", "..", "-DCATCH_INCLUDE_DIR=#{HOMEBREW_PREFIX}/include", *std_cmake_args
      system "make"
      system "make", "install"
    end
  end

  test do
    system "#{bin}/taptempo", "--help"
  end
end
