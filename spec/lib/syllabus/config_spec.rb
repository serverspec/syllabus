require 'spec_helper'

describe Syllabus::Config do
  describe '#hosts' do
    context 'Hosts are passed as an Array' do
      let(:config) {
        <<EOS
hosts %w[foo bar baz]
EOS
      }
      subject {
        described_class.new(config)
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
        described_class.new(config)
      }

      it { expect(subject.hosts).to be == %w[foo bar baz] }
    end
  end
end
