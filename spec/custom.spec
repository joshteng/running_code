def apple
  false
end

describe "test" do
  it "should be true" do
    expect(apple).to eq(true)
  end
end
