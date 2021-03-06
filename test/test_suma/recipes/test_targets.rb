#
# Copyright 2016, Atos <jerome.hurstel@atos.net>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

node.default['nim']['clients'] = { 'client1' => { 'oslevel' => '7100-02-01' },
                                   'client2' => { 'oslevel' => '7100-03-01' },
                                   'client3' => { 'oslevel' => '7100-04-01' } }

aix_suma '31. Valid client list with wildcard' do
  oslevel   '7100-02-02'
  location  '/tmp/img.source/31/'
  targets   'client*'
  action    :download
end

aix_suma '32. Mostly valid client list' do
  oslevel   '7100-02-02'
  location  '/tmp/img.source/32/'
  targets   'client1,invalid,client3'
  action    :download
end

aix_suma '34. Default property targets (all nim clients)' do
  oslevel   '7100-02-02'
  location  '/tmp/img.source/34/'
  # targets	'default'
  action    :download
end

aix_suma '35. Empty property targets (all nim clients)' do
  oslevel   '7100-02-02'
  location  '/tmp/img.source/35/'
  targets   ''
  action    :download
end
