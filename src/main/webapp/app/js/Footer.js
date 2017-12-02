import React, {Component} from 'react';
import style from './../css/Footer.css';

class Footer extends Component{
    render() {
      return (
        <p className={style.footer}>
            <small className={style.footerfont}>
                Version 0.2.5<br/>
            </small>
            <small className={style.footerfont}>
            @Powered by Surevil & NJU TJ
            </small>
	    </p>
      );
    }
} 

export default Footer