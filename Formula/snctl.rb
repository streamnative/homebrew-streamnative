# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Snctl < Formula
  desc "StreamNative Cloud CLI (snctl)"
  homepage "https://streamnative.io/"
  version "0.16.0-rc.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://storage.googleapis.com/downloads.streamnative.cloud/snctl/v0.16.0-rc.1/snctl_0.16.0-rc.1_darwin_amd64.tar.gz"
      sha256 "983cd629662bd3107509415679c0edbfc5f59fb3d4ea6729113af2901d56c3d5"

      def install
        bin.install "snctl"
      end
    end
    if Hardware::CPU.arm?
      url "https://storage.googleapis.com/downloads.streamnative.cloud/snctl/v0.16.0-rc.1/snctl_0.16.0-rc.1_darwin_arm64.tar.gz"
      sha256 "78803fff2850889b895984c76ccc607c7c3e3df7d5f15e9a9800159f64bfba44"

      def install
        bin.install "snctl"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://storage.googleapis.com/downloads.streamnative.cloud/snctl/v0.16.0-rc.1/snctl_0.16.0-rc.1_linux_amd64.tar.gz"
      sha256 "4b7157441ad197eacfbeaf440c1d5235e6f1a1cde9d7d317a1fb3e837786ae3c"

      def install
        bin.install "snctl"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://storage.googleapis.com/downloads.streamnative.cloud/snctl/v0.16.0-rc.1/snctl_0.16.0-rc.1_linux_arm64.tar.gz"
      sha256 "463bdd89c3d5fb2efffdf609f46c3d2526b40ab5b1a866dece884e4ac8c87980"

      def install
        bin.install "snctl"
      end
    end
  end
end
