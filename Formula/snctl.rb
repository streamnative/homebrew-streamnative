class Snctl < Formula
  desc "StreamNative cloud cli tools"
  homepage "https://streamnative.io/"
  url "https://storage.googleapis.com/downloads.sncloud-stg.dev/snctl/v0.4.0-rc.3/snctl_0.4.0-rc.3_darwin_amd64.tar.gz"
  sha256 "22169f351246425f2b813b3f825e3b136bfe255e0b59585be5fcfb29a4d03911"

  def install
    bin.install "snctl"
  end

  test do
    out = shell_output("#{bin}/snctl 2>&1")
    assert_match "Manage StreamNative Cloud resources.", out
  end
end
