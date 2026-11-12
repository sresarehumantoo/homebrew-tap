class Dfinstall < Formula
  desc "Dotfiles installer and manager"
  homepage "https://github.com/sresarehumantoo/dotfiles"
  version "2.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.7.0/dfinstall_2.7.0_darwin_arm64.tar.gz"
      sha256 "7f377b03454cbaf5032efc656fca0e7dbeac51894dd2d2a29ce91031a7ae9f88"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.7.0/dfinstall_2.7.0_darwin_amd64.tar.gz"
      sha256 "42598e0427fb82e11274d8ae444d9c27b5f5674d96dc3b78e42088af813294d7"
    end
  end

  on_linux do
    depends_on "git"

    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.7.0/dfinstall_2.7.0_linux_arm64.tar.gz"
      sha256 "e59e5ca2bc0a3e7a6f009d17c7aaa7705a7bab90b6e737643787702b26678871"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.7.0/dfinstall_2.7.0_linux_amd64.tar.gz"
      sha256 "b3c7a02103e1360f7b96eaa4b4b921b8618e1f42a82dd1efe6a23d8f66acba10"
    end
  end

  resource "content" do
    url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.7.0/dfinstall-content_2.7.0.tar.gz"
    sha256 "41bc9341b0c7a75215b1e7b0db686f89e13d3ba25e8e3360720584d16739de15"
  end

  def install
    bin.install "dfinstall", "dfinstall-mcp"
    resource("content").stage { pkgshare.install "config", ".dfinstall-content.json" }
  end

  test do
    assert_match "(brew)", shell_output("#{bin}/dfinstall --version")
  end
end
