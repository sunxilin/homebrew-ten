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
      # TODO: Update this SHA256 with the actual checksum of your release file
      # Run: shasum -a 256 tman-mac-release-x64.zip
      sha256 "REPLACE_WITH_ACTUAL_SHA256_FOR_INTEL_MAC"
    elsif Hardware::CPU.arm?
      url "https://github.com/TEN-framework/ten-framework/releases/download/#{version}/tman-mac-release-arm64.zip"
      # TODO: Update this SHA256 with the actual checksum of your release file
      # Run: shasum -a 256 tman-mac-release-arm64.zip
      sha256 "REPLACE_WITH_ACTUAL_SHA256_FOR_ARM64_MAC"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/TEN-framework/ten-framework/releases/download/#{version}/tman-linux-release-x64.zip"
      # TODO: Update this SHA256 with the actual checksum
      sha256 "REPLACE_WITH_ACTUAL_SHA256_FOR_LINUX_X64"
    elsif Hardware::CPU.arm?
      url "https://github.com/TEN-framework/ten-framework/releases/download/#{version}/tman-linux-release-arm64.zip"
      # TODO: Update this SHA256 with the actual checksum
      sha256 "REPLACE_WITH_ACTUAL_SHA256_FOR_LINUX_ARM64"
    end
  end

  def install
    # The binary is in the zip file at ten_manager/bin/tman
    # Move it to the Homebrew bin directory
    bin.install "ten_manager/bin/tman"
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
