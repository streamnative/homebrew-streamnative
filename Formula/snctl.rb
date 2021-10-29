# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Snctl < Formula
  desc "StreamNative Cloud CLI (snctl)"
  homepage "https://streamnative.io/"
  version "0.10.2-rc0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://storage.googleapis.com/downloads.streamnative.cloud/snctl/v0.10.2-rc0/snctl_0.10.2-rc0_darwin_amd64.tar.gz"
      sha256 "dcb827113bc2661713b0ebd6979f9be349b782b755247c927cbe26b363eb5e25"

      def install
        bin.install "snctl"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://storage.googleapis.com/downloads.streamnative.cloud/snctl/v0.10.2-rc0/snctl_0.10.2-rc0_linux_arm64.tar.gz"
      sha256 "8587ae5b3dee4fe8703cadf1829371aaf0ad5b5198c5d846ed9973609176de95"

      def install
        bin.install "snctl"
      end
    end
    if Hardware::CPU.intel?
      url "https://storage.googleapis.com/downloads.streamnative.cloud/snctl/v0.10.2-rc0/snctl_0.10.2-rc0_linux_amd64.tar.gz"
      sha256 "5ba7cd9fde2f23771fb78b1e14d0e3bea7f991e8077b2a83db93e65ea47291f2"

      def install
        bin.install "snctl"
      end
    end
  end
end
