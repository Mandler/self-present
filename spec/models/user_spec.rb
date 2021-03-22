require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.not_to validate_presence_of(:first_name) }
  it { is_expected.not_to validate_presence_of(:last_name) }
  it { is_expected.not_to validate_presence_of(:job_title) }
  it { is_expected.not_to validate_presence_of(:github_name) }
end
