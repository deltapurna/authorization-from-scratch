require 'rails_helper'

RSpec::Matchers.define :allow do |*args|
  match do |permission|
    expect(permission.allow?(*args)).to be_truthy
  end
end

describe Permission do
  context 'as guest' do
    subject { Permission.new(nil) }
    it { should allow('devise/sessions', 'new') }
    it { should allow('devise/sessions', 'create') }
    it { should allow('devise/sessions', 'destroy') }

    it { should allow('devise/registrations', 'new') }
    it { should allow('devise/registrations', 'create') }
    it { should_not allow('devise/registrations', 'edit') }
    it { should_not allow('devise/registrations', 'update') }

    it { should allow('topics', 'index') }
    it { should allow('topics', 'show') }
    it { should_not allow('topics', 'new') }
    it { should_not allow('topics', 'create') }
    it { should_not allow('topics', 'edit') }
    it { should_not allow('topics', 'update') }
    it { should_not allow('topics', 'destroy') }
  end

  context 'as member' do
    subject { Permission.new(build(:user, admin: false)) }
    it { should allow('devise/sessions', 'new') }
    it { should allow('devise/sessions', 'create') }
    it { should allow('devise/sessions', 'destroy') }

    it { should allow('devise/registrations', 'new') }
    it { should allow('devise/registrations', 'create') }
    it { should allow('devise/registrations', 'edit') }
    it { should allow('devise/registrations', 'update') }

    it { should allow('topics', 'index') }
    it { should allow('topics', 'show') }
    it { should allow('topics', 'new') }
    it { should allow('topics', 'create') }
    it { should allow('topics', 'edit') }
    it { should allow('topics', 'update') }
    it { should_not allow('topics', 'destroy') }
  end

  context 'as admin' do
    subject { Permission.new(build(:user, admin: true)) }
    it { should allow('anything', 'here') }
  end
end
