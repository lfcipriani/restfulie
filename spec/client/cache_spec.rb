#
#  Copyright (c) 2009 Caelum - www.caelum.com.br/opensource
#  All rights reserved.
# 
#  Licensed under the Apache License, Version 2.0 (the "License"); 
#  you may not use this file except in compliance with the License. 
#  You may obtain a copy of the License at 
#  
#   http://www.apache.org/licenses/LICENSE-2.0 
#  
#  Unless required by applicable law or agreed to in writing, software 
#  distributed under the License is distributed on an "AS IS" BASIS, 
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
#  See the License for the specific language governing permissions and 
#  limitations under the License. 
#

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

context Restfulie::FakeCache do
  
  it "should always retrieve nil, even if it was put" do
    req = Object.new
    url = Object.new
    cache = Restfulie::FakeCache.new
    cache.put(url, req)
    cache.get(url, req).should be_nil
  end
  
end

context Restfulie::Cache::Restrictions do

  it "should not cache DELETE, PUT, TRACE, HEAD, OPTIONS" do
    ['Delete', 'Put', 'Trace', 'Head', 'Options'].each do |verb|
      Restfulie::Cache::Restrictions.may_cache_method("Net::HTTP::#{verb}".constantize).should be_false
    end
  end

  it "should cache GET and POST" do
    ['Get', 'Post'].each do |verb|
      Restfulie::Cache::Restrictions.may_cache_method("Net::HTTP::#{verb}".constantize).should be_true
    end
  end

end