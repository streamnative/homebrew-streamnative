class Pulsarctl < Formula
  desc "CLI for Apache Pulsar written in golang"
  homepage "https://streamnative.io/"
  url "https://github.com/streamnative/pulsarctl.git",
      :tag      => "v0.3.0",
      :revision => "eda516d8290061dd8b6e8675ec5b32e67321ed38"
  sha256 "d0d6b55017cf349dd893248b0541c8026db9be5d5a7c5523d7bb91426c279fe3"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin / "pulsarctl"
  end

  test do
    out = shell_output("#{bin}/pulsarctl 2>&1")
    assert_match "a CLI for Apache Pulsar", out
  end
end
