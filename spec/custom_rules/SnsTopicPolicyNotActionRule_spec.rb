require 'spec_helper'
require 'cfn-model'
require 'cfn-nag/custom_rules/SnsTopicPolicyNotActionRule'

describe SnsTopicPolicyNotActionRule do
  context 'sns topic policy with NotAction' do
    it 'returns offending logical resource id' do
      cfn_model = CfnParser.new.parse read_test_template('json/sns_topic_policy/sns_topic_with_not_action.json')

      actual_logical_resource_ids = SnsTopicPolicyNotActionRule.new.audit_impl cfn_model
      expected_logical_resource_ids = %w(mysnspolicyA mysnspolicyB)

      expect(actual_logical_resource_ids).to eq expected_logical_resource_ids
    end
  end
end
