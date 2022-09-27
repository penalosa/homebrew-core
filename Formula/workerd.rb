require "language/node"

class Workerd < Formula
  desc "👷 workerd, Cloudflare's JavaScript/Wasm Runtime"
  homepage "https://workers.cloudflare.com/"
  url "https://registry.npmjs.org/workerd/-/workerd-1.20220926.2.tgz"
  sha256 "9deae9872f969914138949501379e6f610db8e45fa8c484e6cea2a7d502d278b"
  license "Apache-2.0"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_equal "workerd 2022-09-26\n", shell_output("PWD=$(pwd) #{bin}/workerd --version")
  end
end
