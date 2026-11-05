class Dfinstall < Formula
  desc "Dotfiles installer and manager"
  homepage "https://github.com/sresarehumantoo/dotfiles"
  version "2.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.3.1/dfinstall_2.3.1_darwin_arm64.tar.gz"
      sha256 "d931d3ded90698a7488423b7a0429fadc87f28ec83eea3f8dc975bd0e1358b30"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.3.1/dfinstall_2.3.1_darwin_amd64.tar.gz"
      sha256 "7c6b5508af59b0eab0ca401ba8b2eb1f260db7b6474d19ea5f8d50600c1b1224"
    end
  end

  on_linux do
    depends_on "git"

    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.3.1/dfinstall_2.3.1_linux_arm64.tar.gz"
      sha256 "7baeaead68f7e2720a82cad4222f5eab4e915391dc9c291a59525ed2f422efd7"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.3.1/dfinstall_2.3.1_linux_amd64.tar.gz"
      sha256 "2f7db3c67195d1717d1de1abce9c65790789d59be17358d09c4d67128a0bf083"
    end
  end

  def install
    bin.install "dfinstall", "dfinstall-mcp"
  end

  test do
    assert_match "(brew)", shell_output("#{bin}/dfinstall --version")
  end
end
