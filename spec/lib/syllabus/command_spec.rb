require 'spec_helper'

describe Syllabus::Command do
  describe '#command_class' do
    context 'when a command class found' do
      subject {
        Syllabus::Command.new(
          os_type: 'RedHat',
          name:    :install,
          args:    %w['httpd'],
        )
      }

      it { expect(subject.command_class).to be == Syllabus::Command::RedHat }
    end

    context 'when no command class found' do
      subject {
        Syllabus::Command.new(
          os_type: 'NoSuchType',
          name:    :install,
          args:    %w['httpd'],
        )
      }

      it {
        expect { subject.command_class }.to raise_error Syllabus::Command::NotImplementedError
      }
    end
  end

  describe '#to_s' do
    context 'when a command class found' do
      subject {
        Syllabus::Command.new(
          os_type: 'RedHat',
          name:    :install,
          args:    %w['httpd'],
        )
      }

      it { expect(subject.to_s).to be == "yum -y install 'httpd'" }
    end

    context 'when no command class found' do
      subject {
        Syllabus::Command.new(
          os_type: 'NoSuchType',
          name:    :install,
          args:    %w['httpd'],
        )
      }

      it {
        expect { subject.to_s }.to raise_error Syllabus::Command::NotImplementedError
      }
    end
  end
end
