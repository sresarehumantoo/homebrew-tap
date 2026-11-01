class Dfinstall < Formula
  desc "Dotfiles installer and manager"
  homepage "https://github.com/sresarehumantoo/dotfiles"
  version "2.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.2.0/dfinstall_2.2.0_darwin_arm64.tar.gz"
      sha256 "3e303457a696d5698ca86e9c0844478a8d2f910d596329292db8b44a00756516"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.2.0/dfinstall_2.2.0_darwin_amd64.tar.gz"
      sha256 "eb2b80dcc316fd76b1579ce70830cc9d8e88e6b5eb144caad9853757e0e7b0c3"
    end
  end

  on_linux do
    depends_on "git"

    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.2.0/dfinstall_2.2.0_linux_arm64.tar.gz"
      sha256 "2a0ab3ec3ed48c0303e41d23711e67ea0f2a3fabe67bf22dc4ab43219d895770"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.2.0/dfinstall_2.2.0_linux_amd64.tar.gz"
      sha256 "684dfecbfb7b008f23d09be056ce437d5d8a84b0f2a706e921bd605f6970c3bc"
    end
  end

  def install
    bin.install "dfinstall", "dfinstall-mcp"
  end

  test do
    assert_match "(brew)", shell_output("#{bin}/dfinstall --version")
  end
end
