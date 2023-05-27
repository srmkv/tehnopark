import { Component } from 'react';
import { WithTranslation } from 'react-i18next';

import { IReduxState, IStore } from '../../app/types';
import { getLocalParticipant } from '../../base/participants/functions';
import { sendMessage, setIsPollsTabFocused } from '../actions';
import { SMALL_WIDTH_THRESHOLD } from '../constants';
import { IMessage } from '../reducer';

/**
 * The type of the React {@code Component} props of {@code AbstractChat}.
 */
export interface IProps extends WithTranslation {

    /**
     * Whether the chat is opened in a modal or not (computed based on window width).
     */
    _isModal: boolean;

    /**
     * True if the chat window should be rendered.
     */
    _isOpen: boolean;

    /**
     * True if the polls feature is enabled.
     */
    _isPollsEnabled: boolean;

    /**
     * Whether the poll tab is focused or not.
     */
    _isPollsTabFocused: boolean;

    /**
     * All the chat messages in the conference.
     */
    _messages: IMessage[];

    /**
     * Number of unread chat messages.
     */
    _nbUnreadMessages: number;

    /**
     * Number of unread poll messages.
     */
    _nbUnreadPolls: number;

    /**
     * Function to send a text message.
     *
     * @protected
     */
    _onSendMessage: Function;

    /**
     * Function to toggle the chat window.
     */
    _onToggleChat: Function;

    /**
     * Function to display the chat tab.
     *
     * @protected
     */
    _onToggleChatTab: Function;

    /**
     * Function to display the polls tab.
     *
     * @protected
     */
    _onTogglePollsTab: Function;

    /**
     * Whether or not to block chat access with a nickname input form.
     */
    _showNamePrompt: boolean;

    /**
     * The Redux dispatch function.
     */
    dispatch: IStore['dispatch'];
}

/**
 * Implements an abstract chat panel.
 */
export default class AbstractChat<P extends IProps> extends Component<P> {

    /**
     * Initializes a new {@code AbstractChat} instance.
     *
     * @param {Props} props - The React {@code Component} props to initialize
     * the new {@code AbstractChat} instance with.
     */
    constructor(props: P) {
        super(props);

        // Bind event handlers so they are only bound once per instance.
        this._onSendMessage = this._onSendMessage.bind(this);
        this._onToggleChatTab = this._onToggleChatTab.bind(this);
        this._onTogglePollsTab = this._onTogglePollsTab.bind(this);
    }

    /**
    * Sends a text message.
    *
    * @private
    * @param {string} text - The text message to be sent.
    * @returns {void}
    * @type {Function}
    */
    _onSendMessage(text: string) {
        this.props.dispatch(sendMessage(text));
    }

    /**
     * Display the Chat tab.
     *
     * @private
     * @returns {void}
     */
    _onToggleChatTab() {
        this.props.dispatch(setIsPollsTabFocused(false));
    }

    /**
     * Display the Polls tab.
     *
     * @private
     * @returns {void}
     */
    _onTogglePollsTab() {
        this.props.dispatch(setIsPollsTabFocused(true));
    }
}

/**
 * Maps (parts of) the redux state to {@link Chat} React {@code Component}
 * props.
 *
 * @param {Object} state - The redux store/state.
 * @param {any} _ownProps - Components' own props.
 * @private
 * @returns {{
 *     _isOpen: boolean,
 *     _messages: Array<Object>,
 *     _showNamePrompt: boolean
 * }}
 */
export function _mapStateToProps(state: IReduxState, _ownProps: any) {
    const { isOpen, isPollsTabFocused, messages, nbUnreadMessages } = state['features/chat'];
    const { nbUnreadPolls } = state['features/polls'];
    const _localParticipant = getLocalParticipant(state);
    const { disablePolls } = state['features/base/config'];

    return {
        _isModal: window.innerWidth <= SMALL_WIDTH_THRESHOLD,
        _isOpen: isOpen,
        _isPollsEnabled: !disablePolls,
        _isPollsTabFocused: isPollsTabFocused,
        _messages: messages,
        _nbUnreadMessages: nbUnreadMessages,
        _nbUnreadPolls: nbUnreadPolls,
        _showNamePrompt: !_localParticipant?.name
    };
}
