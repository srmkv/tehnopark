import React, { useCallback } from 'react';
import { useTranslation } from 'react-i18next';
import { TouchableOpacity, ViewStyle } from 'react-native';
import { Text } from 'react-native-paper';
import { useDispatch, useSelector } from 'react-redux';

import { createBreakoutRoomsEvent } from '../../../../../analytics/AnalyticsEvents';
import { sendAnalytics } from '../../../../../analytics/functions';
import { hideSheet } from '../../../../../base/dialog/actions';
import BottomSheet from '../../../../../base/dialog/components/native/BottomSheet';
import Icon from '../../../../../base/icons/components/Icon';
import { IconCloseLarge, IconRingGroup } from '../../../../../base/icons/svg';
import { isLocalParticipantModerator } from '../../../../../base/participants/functions';
import { closeBreakoutRoom, moveToRoom, removeBreakoutRoom } from '../../../../../breakout-rooms/actions';
import { getBreakoutRoomsConfig } from '../../../../../breakout-rooms/functions';
import { IRoom } from '../../../../../breakout-rooms/types';
import styles from '../../../native/styles';

interface IProps {

    /**
     * The room for which the menu is open.
     */
    room: IRoom;
}

const BreakoutRoomContextMenu = ({ room }: IProps) => {
    const dispatch = useDispatch();
    const isLocalModerator = useSelector(isLocalParticipantModerator);
    const { hideJoinRoomButton } = useSelector(getBreakoutRoomsConfig);
    const { t } = useTranslation();

    const onJoinRoom = useCallback(() => {
        sendAnalytics(createBreakoutRoomsEvent('join'));
        dispatch(moveToRoom(room.jid));
        dispatch(hideSheet());
    }, [ dispatch, room ]);

    const onRemoveBreakoutRoom = useCallback(() => {
        dispatch(removeBreakoutRoom(room.jid));
        dispatch(hideSheet());
    }, [ dispatch, room ]);

    const onCloseBreakoutRoom = useCallback(() => {
        dispatch(closeBreakoutRoom(room.id));
        dispatch(hideSheet());
    }, [ dispatch, room ]);

    return (
        <BottomSheet
            addScrollViewPadding = { false }
            showSlidingView = { true }>
            {
                !hideJoinRoomButton && (
                    <TouchableOpacity
                        onPress = { onJoinRoom }
                        style = { styles.contextMenuItem as ViewStyle }>
                        <Icon
                            size = { 24 }
                            src = { IconRingGroup } />
                        <Text style = { styles.contextMenuItemText }>{t('breakoutRooms.actions.join')}</Text>
                    </TouchableOpacity>
                )
            }
            {!room?.isMainRoom && isLocalModerator
                && (room?.participants && Object.keys(room.participants).length > 0
                    ? <TouchableOpacity
                        onPress = { onCloseBreakoutRoom }
                        style = { styles.contextMenuItem as ViewStyle }>
                        <Icon
                            size = { 24 }
                            src = { IconCloseLarge } />
                        <Text style = { styles.contextMenuItemText }>{t('breakoutRooms.actions.close')}</Text>
                    </TouchableOpacity>
                    : <TouchableOpacity
                        onPress = { onRemoveBreakoutRoom }
                        style = { styles.contextMenuItem as ViewStyle }>
                        <Icon
                            size = { 24 }
                            src = { IconCloseLarge } />
                        <Text style = { styles.contextMenuItemText }>{t('breakoutRooms.actions.remove')}</Text>
                    </TouchableOpacity>
                )
            }
        </BottomSheet>
    );
};

export default BreakoutRoomContextMenu;
