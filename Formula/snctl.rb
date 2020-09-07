class Snctl < Formula
  desc "StreamNative cloud cli tools"
  homepage "https://streamnative.io/"
  url "https://storage.googleapis.com/downloads.streamnative.cloud/snctl/v0.5.0/snctl_0.5.0_darwin_amd64.tar.gz"
  sha256 "768e6c41262cd8e4054c33c8d7c21ed92eda129f3a2a3a812d1e51ea883dd04c"

  def install
    bin.install "snctl"
  end

  test do
    out = shell_output("#{bin}/snctl 2>&1")
    assert_match "Manage StreamNative Cloud resources.", out
  end
end
