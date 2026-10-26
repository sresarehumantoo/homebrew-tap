class Dfinstall < Formula
  desc "Dotfiles installer and manager"
  homepage "https://github.com/sresarehumantoo/dotfiles"
  version "2.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.1.1/dfinstall_2.1.1_darwin_arm64.tar.gz"
      sha256 "5297feeb119bfee3ebda6debfd0419563fb040c8e34f4c9b93ad0bf3ef35e7f5"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.1.1/dfinstall_2.1.1_darwin_amd64.tar.gz"
      sha256 "e108d69f3be01644d0406b0c94f7e87f345bf7b1e9c26e6c84b092c1828e79fd"
    end
  end

  on_linux do
    depends_on "git"

    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.1.1/dfinstall_2.1.1_linux_arm64.tar.gz"
      sha256 "d4c3d084e5819340ad0d1d57c54dcdbeac8c29ef7bc90c0d12e2a13e76557efb"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.1.1/dfinstall_2.1.1_linux_amd64.tar.gz"
      sha256 "e9b4cee8d641ba6dc19af4093d4de8578e63477587e33bf5b10c3ed8af32bae7"
    end
  end

  def install
    bin.install "dfinstall", "dfinstall-mcp"
  end

  test do
    assert_match "(brew)", shell_output("#{bin}/dfinstall --version")
  end
end
