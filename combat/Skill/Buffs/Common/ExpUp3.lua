---------------------------------------------------
-- auth： wupeifeng
-- date： 2016/11/08
-- desc： 增加所有经验	


-- 所有途径获取经验增加【参数1百分比】，多层叠加时延长时间	
---------------------------------------------------

require "Common/basic/Timer"
require "Common/basic/Bit"
local Buff = require "Common/combat/Skill/Buff"

local BuffExpUp = ExtendClass(Buff)

function BuffExpUp:__ctor(scene, buff_id, data)
	self.work_independent = true
end

function BuffExpUp:ChangeAllExp(exp)
	return exp * (1 + self:GetPara(1) / 10000)
end

function BuffExpUp:OnCover(data)
	local tmp = self.remain_time
    local res = Buff.OnCover(self, data)
    self.remain_time = tmp + self.last_time
end

return BuffExpUp

