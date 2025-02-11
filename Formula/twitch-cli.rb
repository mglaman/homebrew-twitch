# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class TwitchCli < Formula
  desc "CLI for Twitch's developer offerings"
  homepage "https://github.com/twitchdev/twitch-cli"
  version "1.1.1"
  license "Apache-2.0"
  bottle :unneeded

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/twitchdev/twitch-cli/releases/download/1.1.1/twitch-cli_1.1.1_Darwin_x86_64.tar.gz"
    sha256 "7124c1fda4b0a07a146cea05593d437e5291865408c237c9d8f05a908e36c319"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/twitchdev/twitch-cli/releases/download/1.1.1/twitch-cli_1.1.1_Linux_x86_64.tar.gz"
    sha256 "6443e5a3cd440ddd2821bdbe91847b0274d4e24b699a3a2d191b08d0e16ca271"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/twitchdev/twitch-cli.git", tag: "1.1.1"
    depends_on "go" => :build
  end

  head "https://github.com/twitchdev/twitch-cli.git", branch: "main"
  head do
    depends_on "go" => :build
  end

  def install
    v = version
    if build.head?
      v = "head"
      ldflags = "-X main.buildVersion=#{v}"
      system "go", "build", "-ldflags=#{ldflags}"
      mv "twitch-cli", "twitch"
    end

    if OS.mac? && Hardware::CPU.arm?
      ldflags = "-X main.buildVersion=#{v}"
      system "go", "build", "-ldflags=#{ldflags}"
      mv "twitch-cli", "twitch"
    end

    bin.install "twitch"
  end

  test do
    system "#{bin}/twitch", "version"
  end
end
