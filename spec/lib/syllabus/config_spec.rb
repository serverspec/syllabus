require 'spec_helper'

describe Syllabus::Config do
  let(:backend) {
    backend  = SpecInfra::Backend.backend_for('Exec')
    commands = SpecInfra::Command::RedHat.new
    backend.set_commands(commands)
    backend
  }

  describe '#hosts' do
    context 'Hosts are passed as an Array' do
      let(:config) {
        <<EOS
hosts %w[foo bar baz]
EOS
      }
      subject {
        described_class.new(backend: backend, config: config)
      }

      it { expect(subject.hosts).to be == %w[foo bar baz] }
    end

    context 'Hosts are passed as a Proc' do
      let(:config) {
        <<EOS
hosts -> { %w[foo bar baz] }
EOS
      }
      subject {
        described_class.new(backend: backend, config: config)
      }

      it { expect(subject.hosts).to be == %w[foo bar baz] }
    end
  end

  describe '#path' do
    context 'path are passed as an Array' do
      let(:config) {
        <<EOS
path %w[/bin /usr/bin]
EOS
      }
      subject {
        described_class.new(backend: backend, config: config)
      }

      it { expect(subject.path).to be == %w[/bin /usr/bin] }
    end

    context 'path are passed as a String' do
      let(:config) {
        <<EOS
path '/bin:/usr/bin'
EOS
      }
      subject {
        described_class.new(backend: backend, config: config)
      }

      it { expect(subject.path).to be == %w[/bin /usr/bin] }
    end
  end

  describe '#method_missing' do
    let(:config) {
      <<EOS
install 'httpd'
EOS
    }
    subject {
      described_class.new(backend: backend, config: config)
    }

    it {
      expect(subject.commands.length).to be == 1
      expect(subject.commands.first).to  be_an_instance_of String
    }
  end
end
