import React, { PureComponent } from 'react';
import { WithTranslation } from 'react-i18next';
import { connect } from 'react-redux';

import { IReduxState, IStore } from '../../../app/types';
import { translate } from '../../../base/i18n/functions';
import { updateSettings } from '../../../base/settings/actions';
import { getHideSelfView } from '../../../base/settings/functions';
import ContextMenuItem from '../../../base/ui/components/web/ContextMenuItem';

/**
 * The type of the React {@code Component} props of {@link HideSelfViewVideoButton}.
 */
interface IProps extends WithTranslation {

    /**
     * Button text class name.
     */
    className: string;

    /**
     * Whether or not to hide the self view.
     */
    disableSelfView: boolean;

    /**
     * The redux dispatch function.
     */
    dispatch: IStore['dispatch'];

    /**
     * Click handler executed aside from the main action.
     */
    onClick?: Function;
}

/**
 * Implements a React {@link Component} which displays a button for hiding the local video.
 *
 * @augments Component
 */
class HideSelfViewVideoButton extends PureComponent<IProps> {
    /**
     * Initializes a new {@code HideSelfViewVideoButton} instance.
     *
     * @param {Object} props - The read-only React Component props with which
     * the new instance is to be initialized.
     */
    constructor(props: IProps) {
        super(props);

        // Bind event handlers so they are only bound once for every instance.
        this._onClick = this._onClick.bind(this);
    }

    /**
     * Implements React's {@link Component#render()}.
     *
     * @inheritdoc
     * @returns {null|ReactElement}
     */
    render() {
        const {
            className,
            t
        } = this.props;

        return (
            <ContextMenuItem
                accessibilityLabel = { t('videothumbnail.hideSelfView') }
                className = 'hideselflink'
                id = 'hideselfviewButton'
                onClick = { this._onClick }
                text = { t('videothumbnail.hideSelfView') }
                textClassName = { className } />
        );
    }

    /**
     * Hides the local video.
     *
     * @private
     * @returns {void}
     */
    _onClick() {
        const { disableSelfView, dispatch, onClick } = this.props;

        onClick?.();
        dispatch(updateSettings({
            disableSelfView: !disableSelfView
        }));
    }
}

/**
 * Maps (parts of) the Redux state to the associated {@code FlipLocalVideoButton}'s props.
 *
 * @param {Object} state - The Redux state.
 * @private
 * @returns {IProps}
 */
function _mapStateToProps(state: IReduxState) {
    return {
        disableSelfView: Boolean(getHideSelfView(state))
    };
}

export default translate(connect(_mapStateToProps)(HideSelfViewVideoButton));
