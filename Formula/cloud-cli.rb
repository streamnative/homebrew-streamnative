class CloudCli < Formula
  desc "StreamNative cloud cli tools"
  homepage "https://streamnative.io/"
  url "http:/snctl_0.4.1-rc_darwin_amd64.tar.gz"
  sha256 "11a2f09739e1edeab6f27d8c92f851360d91feb21ec42799cebe44842f2e349d"

  def install
    bin.install "snctl"
  end

  test do
    out = shell_output("#{bin}/snctl 2>&1")
    assert_match "Manage StreamNative Cloud resources.", out
  end
end
