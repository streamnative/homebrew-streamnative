class Snctl < Formula
  desc "StreamNative cloud cli tools"
  homepage "https://streamnative.io/"
  url "https://storage.googleapis.com/downloads.streamnative.cloud/snctl/v0.8.0/snctl_0.8.0_darwin_amd64.tar.gz"
  sha256 "a9348a8138a45d8a9e73e489da054fc8d380bab1aff55ceb7cf404a4a86cca6c"

  def install
    bin.install "snctl"
  end

  test do
    out = shell_output("#{bin}/snctl 2>&1")
    assert_match "Manage StreamNative Cloud resources.", out
  end
end
