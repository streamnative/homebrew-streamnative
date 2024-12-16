# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Snctl < Formula
  desc "StreamNative Cloud CLI (snctl)"
  homepage "https://streamnative.io/"
  version "0.21.0-rc.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://storage.googleapis.com/downloads.streamnative.cloud/snctl/v0.21.0-rc.1/snctl_0.21.0-rc.1_darwin_amd64.tar.gz"
      sha256 "33045f7f3eaaceb1091e295df69715d564c83b098b79aaa572edca3f82ad52a5"

      def install
        bin.install "snctl"
      end
    end
    if Hardware::CPU.arm?
      url "https://storage.googleapis.com/downloads.streamnative.cloud/snctl/v0.21.0-rc.1/snctl_0.21.0-rc.1_darwin_arm64.tar.gz"
      sha256 "b3dc47da3636ed7ea006110f4b16568c3e20f29a830b927b78decd7b1b0e650a"

      def install
        bin.install "snctl"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://storage.googleapis.com/downloads.streamnative.cloud/snctl/v0.21.0-rc.1/snctl_0.21.0-rc.1_linux_amd64.tar.gz"
        sha256 "83835f76321da52eab555943a0e71095acbdec86312e8360e762f40697cc10b2"

        def install
          bin.install "snctl"
        end
      end
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://storage.googleapis.com/downloads.streamnative.cloud/snctl/v0.21.0-rc.1/snctl_0.21.0-rc.1_linux_arm64.tar.gz"
        sha256 "8ef975d0415e4134f74bac31936fa6eb3bd9ad7dac4938de49fe8302ba1e70d7"

        def install
          bin.install "snctl"
        end
      end
    end
  end
end
