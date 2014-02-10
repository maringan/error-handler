require './spec/spec_helper'

describe User do
  it { should validate_presence_of :email  }
  it { should validate_presence_of :iden   }
  it { should validate_uniqueness_of :iden }
  it { should validate_uniqueness_of :email }
end