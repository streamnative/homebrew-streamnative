class Snctl < Formula
  desc "StreamNative cloud cli tools"
  homepage "https://streamnative.io/"
  url "https://storage.googleapis.com/downloads.streamnative.cloud/snctl/v0.9.0/snctl_0.9.0_darwin_amd64.tar.gz"
  sha256 "cdd2bfdf61a8c2a6ab29851f6407483c1f6dfaf41fb7b802cbf2cc424e8d0cb7"

  def install
    bin.install "snctl"
  end

  test do
    out = shell_output("#{bin}/snctl 2>&1")
    assert_match "Manage StreamNative Cloud resources.", out
  end
end
