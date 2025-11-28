# TEN Framework - TMAN Homebrew Formula
# This formula installs the TEN Framework package manager (tman)
#
# To use this formula:
# 1. Create a GitHub repository at: https://github.com/TEN-framework/homebrew-tap
# 2. Copy this file to: Formula/tman.rb
# 3. Users can install with:
#    brew tap TEN-framework/tap
#    brew install tman

class Tman < Formula
  desc "TEN Framework package manager and development tool"
  homepage "https://www.theten.ai/"
  version "0.11.35"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/TEN-framework/ten-framework/releases/download/#{version}/tman-mac-release-x64.zip"
      sha256 "e895f217c47ccc0999485d76a5ac8caa0a67350f9e0544f72ddd3ee89aea51bf"
    elsif Hardware::CPU.arm?
      url "https://github.com/TEN-framework/ten-framework/releases/download/#{version}/tman-mac-release-arm64.zip"
      sha256 "ba163ab1fe56827ed36b3e8b2deeafbe741fc56101b65f5ef6c8a7936709af9c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/TEN-framework/ten-framework/releases/download/#{version}/tman-linux-release-x64.zip"
      sha256 "fa8220a7f474ef3a5b3afcf1f23ca1ecf1fc11cdbe223e02febdacc0c184fc20"
    elsif Hardware::CPU.arm?
      url "https://github.com/TEN-framework/ten-framework/releases/download/#{version}/tman-linux-release-arm64.zip"
      sha256 "799392b4f2c6226206d22cacea926cda98da9925e015f170aecf9633cf82304b"
    end
  end

  def install
    # The binary is directly accessible after unzip
    bin.install "bin/tman"
  end

  def caveats
    <<~EOS
      🎉 tman has been installed successfully!

      Common commands:
        tman --version       # Check version
        tman --help          # Show help
        tman install         # Install project dependencies
        tman create <name>   # Create new project

      For more information, visit:
        https://github.com/TEN-framework/ten-framework
    EOS
  end

  test do
    # Test that tman can be executed and returns version info
    assert_match version.to_s, shell_output("#{bin}/tman --version")
  end
end
