# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Snctl < Formula
  desc "StreamNative Cloud CLI (snctl)"
  homepage "https://streamnative.io/"
  version "0.13.0-rc7"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://storage.googleapis.com/downloads.streamnative.cloud/snctl/v0.13.0-rc7/snctl_0.13.0-rc7_darwin_amd64.tar.gz"
      sha256 "f164a407826ef8ede509b3f1043500b8fa88d5e2f6559a028c22c7d02adfbdfa"

      def install
        bin.install "snctl"
      end
    end
    if Hardware::CPU.arm?
      url "https://storage.googleapis.com/downloads.streamnative.cloud/snctl/v0.13.0-rc7/snctl_0.13.0-rc7_darwin_arm64.tar.gz"
      sha256 "cb5e05639328070e5e31643f593f92149a6dbe8735f552b9c193bd3b90987bb8"

      def install
        bin.install "snctl"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://storage.googleapis.com/downloads.streamnative.cloud/snctl/v0.13.0-rc7/snctl_0.13.0-rc7_linux_amd64.tar.gz"
      sha256 "45fb436548c2a4b665fade192a11f37147b0fed40c8514d8543c4b133b900048"

      def install
        bin.install "snctl"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://storage.googleapis.com/downloads.streamnative.cloud/snctl/v0.13.0-rc7/snctl_0.13.0-rc7_linux_arm64.tar.gz"
      sha256 "e980b1a2beaf4e438b1d8a6c0c0a7886b7a886cf53a5f743386f472d434bb067"

      def install
        bin.install "snctl"
      end
    end
  end
end
