<?php

namespace App\Services;

use App\Models\User;
use App\Models\Bought;
use App\Models\Node;
use App\Utils\Tools;

class Analytics
{
    public function getTotalUser()
    {
        return User::count();
    }

    public function getClass0User()
    {
        return User::where('class', '=', 0)->count();
    }

    public function getClass1User()
    {
        return User::where('class', '=', 1)->count();
    }

    public function getShop1User()
    {
        $time=time()-30*86400;
        return Bought::where('shopid', '=', 1)->where('datetime', '>', $time)->count();
        
    }
    public function getRealCost()
    {
        $time=time()-30*86400;
        return Bought::where('datetime', '>', $time)->sum(price);
    }

    public function getCheckinUser()
    {
        return User::where('last_check_in_time', '>', 0)->count();
    }
    
    public function getTodayCheckinUser()
    {
        return User::where('last_check_in_time', '>', strtotime('today'))->count();
    }

    public function getTrafficUsage()
    {
        $total = User::sum('u') + User::sum('d');
        return Tools::flowAutoShow($total);
    }
    
    public function getTodayTrafficUsage()
    {
        $total = User::sum('u') + User::sum('d') - User::sum('last_day_t');
        return Tools::flowAutoShow($total);
    }
    
    
    public function getRawTodayTrafficUsage()
    {
        $total = User::sum('u') + User::sum('d') - User::sum('last_day_t');
        return $total;
    }
    
    public function getLastTrafficUsage()
    {
        $total = User::sum('last_day_t');
        return Tools::flowAutoShow($total);
    }
    
    
    public function getRawLastTrafficUsage()
    {
        $total = User::sum('last_day_t');
        return $total;
    }
    
    public function getUnusedTrafficUsage()
    {
        $total = User::sum('transfer_enable') - User::sum('u') - User::sum('d');
        return Tools::flowAutoShow($total);
    }
    
    public function getRawUnusedTrafficUsage()
    {
        $total = User::sum('transfer_enable') - User::sum('u') - User::sum('d');
        return $total;
    }
    
    
    public function getTotalTraffic()
    {
        $total = User::sum('transfer_enable');
        return Tools::flowAutoShow($total);
    }
    
    public function getRawTotalTraffic()
    {
        $total = User::sum('transfer_enable');
        return $total;
    }

    public function getOnlineUser($time)
    {
        $time = time() - $time;
        return User::where('t', '>', $time)->count();
    }
    
    public function getUnusedUser()
    {
        return User::where('t', '=', 0)->count();
    }

    public function getTotalNode()
    {
        return Node::count();
    }
    
    public function getTotalSSNode()
    {
        return Node::where('node_heartbeat', '>', 0)->where(
                    function ($query) {
                        $query->Where('sort', '=', 0)
                            ->orWhere('sort', '=', 10);
                    }
                )->count();
    }
    
    public function getAliveSSNode()
    {
        return Node::where(
            function ($query) {
                $query->Where('sort', '=', 0)
                    ->orWhere('sort', '=', 10);
            }
        )->where('node_heartbeat', '>', time()-90)->count();
    }
}
