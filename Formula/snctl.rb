# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Snctl < Formula
  desc "StreamNative Cloud CLI (snctl)"
  homepage "https://streamnative.io/"
  version "0.14.0-rc21"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://storage.googleapis.com/downloads.streamnative.cloud/snctl/v0.14.0-rc21/snctl_0.14.0-rc21_darwin_arm64.tar.gz"
      sha256 "e599411c85b18b0a0413674e17968587e6ee817f0ac6f7cf49c38baad3eb571f"

      def install
        bin.install "snctl"
      end
    end
    if Hardware::CPU.intel?
      url "https://storage.googleapis.com/downloads.streamnative.cloud/snctl/v0.14.0-rc21/snctl_0.14.0-rc21_darwin_amd64.tar.gz"
      sha256 "49f2778c2ab3bbfda5dadd86d57ae92532b5dbb1488e0f056c2aae51e8b017ca"

      def install
        bin.install "snctl"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://storage.googleapis.com/downloads.streamnative.cloud/snctl/v0.14.0-rc21/snctl_0.14.0-rc21_linux_arm64.tar.gz"
      sha256 "c43517d7e3118d3669c3ec6018d2bfaf871f378895c990ce53d7b7efa71e3531"

      def install
        bin.install "snctl"
      end
    end
    if Hardware::CPU.intel?
      url "https://storage.googleapis.com/downloads.streamnative.cloud/snctl/v0.14.0-rc21/snctl_0.14.0-rc21_linux_amd64.tar.gz"
      sha256 "b11efafdff3e573fad7abee0a07961507d10f9bb15654bda2c4e67f5db13326f"

      def install
        bin.install "snctl"
      end
    end
  end
end
