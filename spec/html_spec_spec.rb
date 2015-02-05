require 'rspec'

require 'html_spec'

RSpec.describe HtmlSpec do
  include HtmlSpec::Matchers

  it 'should do something' do
    expect(%(
      <p></p>
        )).to be_html_eql(%(<p></p>))
  end

  it 'should do something' do
    expect(%(
      <P class="test" id="1"></P>
        )).to be_html_eql(%(<p id="1" class="test"></p>))
  end

  it 'should do something' do
    expect(%(
      <P class="test2" id="1"></P>
        )).not_to be_html_eql(%(<p id="1" class="test"></p>))
  end

end
