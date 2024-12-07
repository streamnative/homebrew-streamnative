# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Snctl < Formula
  desc "StreamNative Cloud CLI (snctl)"
  homepage "https://streamnative.io/"
  version "0.20.0-rc.2"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://storage.googleapis.com/downloads.streamnative.cloud/snctl/v0.20.0-rc.2/snctl_0.20.0-rc.2_darwin_amd64.tar.gz"
      sha256 "413e5c552df64726dc14c84c46ae48c4016f5c4c227e6ae60c3a08326dd6ba43"

      def install
        bin.install "snctl"
      end
    end
    on_arm do
      url "https://storage.googleapis.com/downloads.streamnative.cloud/snctl/v0.20.0-rc.2/snctl_0.20.0-rc.2_darwin_arm64.tar.gz"
      sha256 "7b9cd99ab5e931f6275c91c8f490335518a7d0e4d567ddb3d6cb3d9e37b6ed19"

      def install
        bin.install "snctl"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://storage.googleapis.com/downloads.streamnative.cloud/snctl/v0.20.0-rc.2/snctl_0.20.0-rc.2_linux_amd64.tar.gz"
        sha256 "7524ec2ce8f9e8b41e3f5c2ef30a7fcbd0d5e64bd0315777cbe286fad7df8d3a"

        def install
          bin.install "snctl"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://storage.googleapis.com/downloads.streamnative.cloud/snctl/v0.20.0-rc.2/snctl_0.20.0-rc.2_linux_arm64.tar.gz"
        sha256 "6865bd1133c2651a01c4aacc559f12364f76d6d8aebac588b09fe7564716bf44"

        def install
          bin.install "snctl"
        end
      end
    end
  end
end
