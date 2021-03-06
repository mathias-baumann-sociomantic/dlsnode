/*******************************************************************************

    Implementation of DLS 'GetChannelsRequest' request

    copyright:
        Copyright (c) 2015-2017 sociomantic labs GmbH. All rights reserved

    License:
        Boost Software License Version 1.0. See LICENSE.txt for details.

*******************************************************************************/

module dlsnode.request.GetChannelsRequest;

/*******************************************************************************

    Imports

*******************************************************************************/

import Protocol = dlsproto.node.request.GetChannels;

/*******************************************************************************

    Request handler

*******************************************************************************/

public scope class GetChannelsRequest : Protocol.GetChannels
{
    import dlsnode.request.model.ConstructorMixin;

    /***************************************************************************

        Adds this.resources and constructor to initialize it and forward
        arguments to base

    ***************************************************************************/

    mixin RequestConstruction!();

    /***************************************************************************

        Must return list of all channels stored in this node.

        Returns:
            list of channel names

    ***************************************************************************/

    final override protected cstring[] getChannelsIds ( )
    {
        auto list = this.resources.channel_list_buffer;

        foreach (channel; this.resources.storage_channels)
            *list ~= channel.id;

        return *list;
    }
}
