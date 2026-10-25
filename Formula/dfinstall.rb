class Dfinstall < Formula
  desc "Dotfiles installer and manager"
  homepage "https://github.com/sresarehumantoo/dotfiles"
  version "2.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.0.0/dfinstall_2.0.0_darwin_arm64.tar.gz"
      sha256 "9e36353e218cdf4b812cf6e21883d931841ebd028a2b692b84b22c39ff58473b"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.0.0/dfinstall_2.0.0_darwin_amd64.tar.gz"
      sha256 "5275bd6c080d28b91fd54eda7dcc49798e1d162d20490009420cee84bed297ee"
    end
  end

  on_linux do
    depends_on "git"

    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.0.0/dfinstall_2.0.0_linux_arm64.tar.gz"
      sha256 "6b0586e809f2ed8f65a303a4ae6c16f70ecbcce4bf278f28a09d74d14a2dca91"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.0.0/dfinstall_2.0.0_linux_amd64.tar.gz"
      sha256 "c29cbe64c4ecbcee356f843cbed93f9d074e99bcb5e2c0824b8a0192da92eed5"
    end
  end

  def install
    bin.install "dfinstall", "dfinstall-mcp"
  end

  test do
    assert_match "(brew)", shell_output("#{bin}/dfinstall --version")
  end
end
