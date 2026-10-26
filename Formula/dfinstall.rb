class Dfinstall < Formula
  desc "Dotfiles installer and manager"
  homepage "https://github.com/sresarehumantoo/dotfiles"
  version "2.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.1.0/dfinstall_2.1.0_darwin_arm64.tar.gz"
      sha256 "5e81c61eeccadb27b43d7a7f7b0bfe87f3c6dde1ffb27e08a1af64b132d1ec3a"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.1.0/dfinstall_2.1.0_darwin_amd64.tar.gz"
      sha256 "68ab3c17ecd1d9cb4cd2fd14e5fede2eaf04fb7891925a5eea063ee54adb8b17"
    end
  end

  on_linux do
    depends_on "git"

    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.1.0/dfinstall_2.1.0_linux_arm64.tar.gz"
      sha256 "b7d3c040809ff8bd7636cc8032e5672770be0da2e440806c36b45e79374e73e6"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.1.0/dfinstall_2.1.0_linux_amd64.tar.gz"
      sha256 "6e821b9e4067c749ff22531602e4084376ccbc5619d7ccf4775fbfd27b620775"
    end
  end

  def install
    bin.install "dfinstall", "dfinstall-mcp"
  end

  test do
    assert_match "(brew)", shell_output("#{bin}/dfinstall --version")
  end
end
