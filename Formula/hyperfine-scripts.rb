# Copyright (c) 2023 Mateusz Piotrowski <0mp@FreeBSD.org>
# SPDX-License-Identifier: BSD-2-Clause

class HyperfineScripts < Formula
  include Language::Python::Shebang
  include Language::Python::Virtualenv

  desc "Scripts for data analysis of Hyperfine benchmarking results"
  homepage "https://github.com/sharkdp/hyperfine"
  url "https://github.com/sharkdp/hyperfine/archive/refs/tags/v1.15.0.tar.gz"
  sha256 "b1a7a11a1352cdb549cc098dd9caa6c231947cc4dd9cd91ec25072d6d2978172"
  license any_of: ["MIT", "Apache-2.0"]
  revision 1

  depends_on "matplotlib"
  depends_on "numpy"
  depends_on "python@3.11"
  depends_on "scipy"

  def install
    # Install all the scripts to libexec.
    libexec.install Dir["scripts/*.py"]
    # Create symlinks in bin for easier access.  Make sure that the symlinks
    # start with "hyperfine_".
    libexec.find do |path|
      bin.install_symlink path => path.basename.to_s.sub(/^/, "hyperfine_") unless path.directory?
    end
    # Fix the shebangs.
    rewrite_shebang detected_python_shebang, *libexec.children
  end

  test do
    (testpath/"test.json").write <<~EOS
      {
        "results": [
          {
            "command": "whoami",
            "mean": 0.002360546720000001,
            "stddev": null,
            "median": 0.002360546720000001,
            "user": 0.0002513799999999999,
            "system": 0.0007081800000000001,
            "min": 0.002360546720000001,
            "max": 0.002360546720000001,
            "times": [
              0.002360546720000001
            ],
            "exit_codes": [
              0
            ]
          }
        ]
      }
    EOS
    system "#{bin}/hyperfine_advanced_statistics.py", "#{testpath}/test.json"
  end
end
