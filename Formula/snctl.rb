# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Snctl < Formula
  desc "StreamNative Cloud CLI (snctl)"
  homepage "https://streamnative.io/"
  version "0.19.1"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://storage.googleapis.com/downloads.streamnative.cloud/snctl/v0.19.1/snctl_0.19.1_darwin_amd64.tar.gz"
      sha256 "0be00c0269bbf1098117cffbe623af17b41a5cdc47319a82976b5fe3df510e49"

      def install
        bin.install "snctl"
      end
    end
    on_arm do
      url "https://storage.googleapis.com/downloads.streamnative.cloud/snctl/v0.19.1/snctl_0.19.1_darwin_arm64.tar.gz"
      sha256 "d053eca7a408afed70f30403289e2c2c888e27b01323577a3be0db1e34ff8a37"

      def install
        bin.install "snctl"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://storage.googleapis.com/downloads.streamnative.cloud/snctl/v0.19.1/snctl_0.19.1_linux_amd64.tar.gz"
        sha256 "9a88a0c4c530ccce5fe53a6077899d75ff2434e3625d10f66e7964e43a995167"

        def install
          bin.install "snctl"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://storage.googleapis.com/downloads.streamnative.cloud/snctl/v0.19.1/snctl_0.19.1_linux_arm64.tar.gz"
        sha256 "220825f3a5b19245ffbedaafb14a7ebd23a9e6cfcc788c815ede89cf3d72573d"

        def install
          bin.install "snctl"
        end
      end
    end
  end
end
