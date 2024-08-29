# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Snctl < Formula
  desc "StreamNative Cloud CLI (snctl)"
  homepage "https://streamnative.io/"
  version "0.19.2"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://storage.googleapis.com/downloads.streamnative.cloud/snctl/v0.19.2/snctl_0.19.2_darwin_amd64.tar.gz"
      sha256 "4ede75c4956172cb9bc2129466a2509ed1e30e75c044c3a6ea81526c414b9161"

      def install
        bin.install "snctl"
      end
    end
    on_arm do
      url "https://storage.googleapis.com/downloads.streamnative.cloud/snctl/v0.19.2/snctl_0.19.2_darwin_arm64.tar.gz"
      sha256 "16b97bb7e88727403b438636fef7d89a0b48dd23dd767725a77ac40c38548c1d"

      def install
        bin.install "snctl"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://storage.googleapis.com/downloads.streamnative.cloud/snctl/v0.19.2/snctl_0.19.2_linux_amd64.tar.gz"
        sha256 "89a9598a3f3a133bc078f31680e2313ec245d1778627551d7f1f46385b9d8223"

        def install
          bin.install "snctl"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://storage.googleapis.com/downloads.streamnative.cloud/snctl/v0.19.2/snctl_0.19.2_linux_arm64.tar.gz"
        sha256 "97960f25f52a0e95970173d03087a1822143e11789222f9c47e0fc356302fc72"

        def install
          bin.install "snctl"
        end
      end
    end
  end
end
