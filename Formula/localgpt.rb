# The localgpt command line, prebuilt: the binary the npm package carries for
# this computer. Rendered by `cargo xtask formula` in the localgpt repository.
class Localgpt < Formula
  desc "Command-line tool and MCP server for .world packages, and screenplay previs"
  homepage "https://localgpt.app/"
  url "https://registry.npmjs.org/localgpt/-/localgpt-0.7.0.tgz"
  sha256 "14f080cbd3872f3e246300ce8d3ae3126d91ead4508dca6ac21f7896b2abe0c9"
  license "Apache-2.0"

  livecheck do
    url "https://registry.npmjs.org/localgpt/latest"
    strategy :json do |json|
      json["version"]
    end
  end

  def install
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "x64"
    bin.install "vendor/#{os}-#{arch}/localgpt"
    generate_completions_from_executable(bin/"localgpt", "completion")
  end

  test do
    assert_equal "localgpt #{version}", shell_output("#{bin}/localgpt --version").strip
    system bin/"localgpt", "world", "init", testpath/"smoke.world"
    system bin/"localgpt", "world", "verify", testpath/"smoke.world"
  end
end
