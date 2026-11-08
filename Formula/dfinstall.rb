class Dfinstall < Formula
  desc "Dotfiles installer and manager"
  homepage "https://github.com/sresarehumantoo/dotfiles"
  version "2.4.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.4.3/dfinstall_2.4.3_darwin_arm64.tar.gz"
      sha256 "cf1f605c13111bec008c819f143c9ee44e6815e160b345dad18f876d002d93d1"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.4.3/dfinstall_2.4.3_darwin_amd64.tar.gz"
      sha256 "adb6a5557579e7b6e5f2ce419ba2f45c24c613d090a0c6e24e7162db0f7e5c25"
    end
  end

  on_linux do
    depends_on "git"

    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.4.3/dfinstall_2.4.3_linux_arm64.tar.gz"
      sha256 "271ea11842e2110a96ab8f8f35b20966f11fa32b9374bdd2769c71acc97893f0"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.4.3/dfinstall_2.4.3_linux_amd64.tar.gz"
      sha256 "011fe3f7965d8581eb823f89e16f5012a0b7b706811ab360d5d7047cf774a057"
    end
  end

  resource "content" do
    url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.4.3/dfinstall-content_2.4.3.tar.gz"
    sha256 "a00aa26ad47accda3bd9ae3824c28d3d9bebecc2bdf72f24a9f2efe784f58c61"
  end

  def install
    bin.install "dfinstall", "dfinstall-mcp"
    resource("content").stage { pkgshare.install "config", ".dfinstall-content.json" }
  end

  test do
    assert_match "(brew)", shell_output("#{bin}/dfinstall --version")
  end
end
