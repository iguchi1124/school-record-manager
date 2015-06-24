# coding: utf-8
require 'rails_helper'

describe RecordDecorator do
  let(:record) { Record.new.extend RecordDecorator }
  subject { record }
  it { should be_a Record }
end
