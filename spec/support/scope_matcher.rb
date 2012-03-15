RSpec::Matchers.define :have_scope do |scope_name, *args|
  match do |actual|
    actual.send(scope_name, *args) == actual
  end

  failure_message do |actual|
    "Expected relation to have scope #{scope_name} #{args.present? ?
        "with args" : ""} but it didn't " + actual.to_sql
  end

  negative_failure_message do |actual|
    "Expected relation not to have scope #{scope_name} #{args.present? ?
        "with args" : ""} but it didn't " + actual.to_sql
  end
end