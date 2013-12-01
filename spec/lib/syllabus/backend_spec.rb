require 'spec_helper'

describe Syllabus::Backend do
  describe '#backend_class' do
    context 'when a backend class found' do
      subject {
        Syllabus::Backend.new(type: 'Exec')
      }

      it { expect(subject.backend_class).to be == SpecInfra::Backend::Exec }
    end

    context 'when no command class found' do
      subject {
        Syllabus::Backend.new(type: 'NoSuchType')
      }

      it {
        expect { subject.backend_class }.to raise_error Syllabus::Backend::NotImplementedError
      }
    end
  end
end
