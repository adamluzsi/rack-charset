require 'spec_helper'
describe Rack::Charset do
  include Rack::App::Test

  it 'has a version number' do
    expect(Rack::Charset::VERSION).not_to be nil
  end

  describe '#call' do
    context 'when header is given' do
      context 'when charset given in the content type' do
        rack_app do
          middlewares do |b|
            b.use Rack::Charset, 'UTF-8'
          end

          get '/' do
            response.headers['Content-Type'] = 'text/html; charset=ASCII'
            'OK'
          end
        end

        it 'should not attack the charset' do
          expect(get(url: '/').headers['Content-Type']).to eq 'text/html; charset=ASCII'
        end
      end

      context 'when charset missing from the content type' do
        rack_app do
          middlewares do |b|
            b.use Rack::Charset, 'UTF-8'
          end

          get '/' do
            response.headers['Content-Type'] = 'text/html'
            'OK'
          end
        end

        it 'should not attack the charset' do
          expect(get(url: '/').headers['Content-Type']).to eq 'text/html; charset=UTF-8'
        end
      end
    end
  end
end
