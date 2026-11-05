class Dfinstall < Formula
  desc "Dotfiles installer and manager"
  homepage "https://github.com/sresarehumantoo/dotfiles"
  version "2.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.3.0/dfinstall_2.3.0_darwin_arm64.tar.gz"
      sha256 "257f584c263cfa2ad21c501b523a37b6624ceb0345f0d1042080e3660e28c1bd"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.3.0/dfinstall_2.3.0_darwin_amd64.tar.gz"
      sha256 "9084b943f75705d32debfa6edfead9fade871dff975515ff393bd9c05520d0d9"
    end
  end

  on_linux do
    depends_on "git"

    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.3.0/dfinstall_2.3.0_linux_arm64.tar.gz"
      sha256 "49e9a9b27c6a937eb879de53ead9f924890861a5d2039ed67bc9f4ce6d43e3f9"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.3.0/dfinstall_2.3.0_linux_amd64.tar.gz"
      sha256 "b9093a47922f4d2424bac10df5dae41e308f47b2222c10df3867ed037934de1a"
    end
  end

  def install
    bin.install "dfinstall", "dfinstall-mcp"
  end

  test do
    assert_match "(brew)", shell_output("#{bin}/dfinstall --version")
  end
end
