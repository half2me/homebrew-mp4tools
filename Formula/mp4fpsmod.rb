class Mp4fpsmod < Formula
  desc "mp4 time code editor"
  homepage "https://github.com/nu774/mp4fpsmod"
  url "https://github.com/nu774/mp4fpsmod/archive/refs/tags/v0.26.zip"
  sha256 "6f975f6980a3a19c2742e6fd4faceb05f7f4668b42d224c0c304f5f126eb6f04"
  license "NOASSERTION"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build

  def install
    system "./bootstrap.sh"
    system "./configure", *std_configure_args, "--disable-silent-rules"
    system "make"
    system "strip", "mp4fpsmod"
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test mp4fpsmod`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "which", "mp4fpsmod"
  end
end
